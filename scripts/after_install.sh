#!/bin/bash
set -e

echo "🔐 Authenticating AWS ECR..."
aws ecr get-login-password --region ap-south-1 | sudo docker login --username AWS --password-stdin 879381243591.dkr.ecr.ap-south-1.amazonaws.com

echo "🐳 Building Docker image..."
docker build -t 879381243591.dkr.ecr.ap-south-1.amazonaws.com/demorepo:latest .

echo "📤 Pushing Docker image to Amazon ECR..."
docker push 879381243591.dkr.ecr.ap-south-1.amazonaws.com/demorepo:latest

echo "⬇️ Pulling latest Docker image on EC2..."
sudo docker pull 879381243591.dkr.ecr.ap-south-1.amazonaws.com/demorepo:latest

echo "✅ AfterInstall steps completed successfully!"
