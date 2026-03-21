#!/bin/bash

echo "Cleaning up Docker resources..."
docker compose down
docker system prune -f
docker volume prune -f

echo "Removing node_modules and build artifacts..."
rm -rf node_modules
rm -rf .next
rm -rf dist

echo "Clean install and build..."
npm install
npm run build

echo "Rebuilding containers..."
docker compose build --no-cache
docker compose up -d

echo "Done!"
