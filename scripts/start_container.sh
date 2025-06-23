#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull pranam2835/sample-python-flask-app

# Run the Docker image as a container
echo run -d -p 5000:5000 pranam2835/sample-python-flask-app  
