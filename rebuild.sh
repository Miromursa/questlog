#!/bin/bash

echo "Rebuilding questlog containers..."
docker compose down
docker compose build --no-cache
docker compose up -d

echo "Checking container status..."
docker compose ps

echo "Showing recent logs..."
docker compose logs --tail=10 app
