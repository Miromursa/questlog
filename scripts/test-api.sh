#!/bin/bash

echo "Testing API endpoints..."

# Test GET
echo "Testing GET /api/tasks..."
curl -s http://localhost:5432/api/tasks | jq .

# Test POST
echo -e "\nTesting POST /api/tasks..."
TASK_ID="test-$(date +%s)"
curl -s -X POST http://localhost:5432/api/tasks \
  -H "Content-Type: application/json" \
  -d "{\"id\":\"$TASK_ID\",\"title\":\"API Test Task\",\"priority\":\"B\",\"category\":\"today\",\"completed\":false,\"createdAt\":$(date +%s)000}" \
  | jq .

# Verify task was created
echo -e "\nVerifying task was created..."
curl -s http://localhost:5432/api/tasks | jq ".[] | select(.id == \"$TASK_ID\")"
