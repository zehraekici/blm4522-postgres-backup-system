#!/bin/bash

DB_NAME="backup_demo"
DB_USER="postgres"
BACKUP_DIR="$HOME/pg_backup_project/backups"
LOG_DIR="$HOME/pg_backup_project/logs"

DATE=$(date +"%Y-%m-%d_%H-%M")
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_$DATE.sql"
LOG_FILE="$LOG_DIR/backup.log"

mkdir -p "$BACKUP_DIR" "$LOG_DIR"

pg_dump -U $DB_USER $DB_NAME > $BACKUP_FILE 2>> $LOG_FILE

if [ $? -eq 0 ]; then
    echo "$DATE - Backup SUCCESS" >> $LOG_FILE
else
    echo "$DATE - Backup FAILED" >> $LOG_FILE
fi
