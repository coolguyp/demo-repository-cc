#!/bin/bash
set -e

# Stop and remove existing container if running
docker stop sample-python-flask-app || true
docker rm sample-python-flask-app || true
