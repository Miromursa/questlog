#!/bin/bash

BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/tasks_backup_$TIMESTAMP.db"

echo "Creating database backup..."

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Copy database from container
docker compose exec app cp /app/data/tasks.db /tmp/tasks_backup.db
docker cp questlog-app-1:/tmp/tasks_backup.db $BACKUP_FILE

echo "Backup created: $BACKUP_FILE"

# List recent backups
echo -e "\nRecent backups:"
ls -lh $BACKUP_DIR/ | tail -5
