#!/bin/bash
set -e

# Pull the image
docker pull pranam2835/sample-python-flask-app 

# Run the container
docker run -d --name sample-python-flask-app -p 5000:5000 pranam2835/sample-python-flask-app
