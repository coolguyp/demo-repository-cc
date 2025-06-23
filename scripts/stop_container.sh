#!/bin/bash
set -e

echo "Stopping existing container if it exists..."
docker stop flask-container || true
docker rm flask-container || true
