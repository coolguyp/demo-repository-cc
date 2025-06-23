#!/bin/bash
set -e

echo "Pulling Docker image..."
docker pull pranam2835/sample-python-flask-app

echo "Stopping existing containers (if any)..."
docker stop $(docker ps -aq) || true
docker rm $(docker ps -aq) || true

echo "Starting container..."
docker run -d -p 5000:5000 pranam2835/sample-python-flask-app
