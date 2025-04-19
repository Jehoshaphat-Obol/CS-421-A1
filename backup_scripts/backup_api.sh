#!/bin/bash

# Directories
PROJECT_DIR="/home/ubuntu/app"
BACKUP_DIR="/home/ubuntu/backups"
LOG_FILE="/var/log/backup.log"
DATE=$(date +%F)

# Filenames
BACKUP_FILE="$BACKUP_DIR/api_backup_$DATE.tar.gz"

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Create backup
tar -czf "$BACKUP_FILE" "$PROJECT_DIR" 2>>"$LOG_FILE"
if [ $? -eq 0 ]; then
    log "Backup created successfully: $BACKUP_FILE"
else
    log "Failed to create backup: $BACKUP_FILE"
fi

# Remove backups older than 7 days
find "$BACKUP_DIR" -name "*.tar.gz" -type f -mtime +7 -exec rm -f {} \; -exec echo "Deleted old backup: {}" >> "$LOG_FILE" \;
