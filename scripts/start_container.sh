#!/bin/bash
set -e  # Exit on any error

echo "Removing existing container if it exists..."
docker rm -f flask-container || true

echo "Pulling Docker image..."
docker pull pranam2835/sample-python-flask-app

echo "Starting container..."
docker run -d -p 5000:5000 --name flask-container pranam2835/sample-python-flask-app

echo "Deployment container started."
