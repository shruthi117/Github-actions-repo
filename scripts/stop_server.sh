#!/bin/bash
set -e

echo "🛑 Stopping application..."
sudo docker stop myapp-container || true
sudo docker rm myapp-container || true
