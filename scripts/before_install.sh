#!/bin/bash
set -e

echo "🔧 Updating packages..."
sudo apt update -y

echo "🐳 Installing Docker..."
if ! command -v docker &> /dev/null; then
    sudo apt install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker ubuntu  # Allows 'ubuntu' user to run Docker without sudo
else
    echo "✅ Docker is already installed."
fi

echo "🔐 Installing AWS CLI..."
if ! command -v aws &> /dev/null; then
    sudo apt install -y awscli
else
    echo "✅ AWS CLI is already installed."
fi

echo "🛑 Stopping old application (if running)..."
sudo docker stop demorepo-container || true
sudo docker rm demorepo-container || true

#create our working directory if it doesnt exist
DIR="/home/ubuntu/app"
if [ -d "$DIR" ]; then
  echo "${DIR} exists"
else
  echo "Creating ${DIR} directory"
  mkdir ${DIR}
fi
