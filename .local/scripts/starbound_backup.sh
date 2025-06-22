#!/bin/zsh

# Variables
BACKUP_DIR="/media/backups/starbound/"
# find /media/backups/starbound -type f -name "*.tar.gz" -mtime +2 -exec rm {} \;
UNIVERSE_DIR="/home/justinprime/Steam/steamapps/common/Starbound/storage/universe"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="$BACKUP_DIR/starbound_backup.log"
# Backup process
echo "[$(date)] Starting backup..." >>"$LOG_FILE"

cp -r $UNIVERSE_DIR $BACKUP_DIR/current_verse
tar -czf "$BACKUP_DIR/universe_backup_$TIMESTAMP.tar.gz" -C "$BACKUP_DIR/current_verse" .
if [ $? -eq 0 ]; then
  echo "[$(date)] Backup successful: universe_backup_$TIMESTAMP.tar.gz" >>"$LOG_FILE"
else
  echo "[$(date)] Backup failed" >>"$LOG_FILE"
fi

# Delete backups older than 7 days (optional)
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +1 -exec rm {} \;
echo "[$(date)] Old backups cleaned." >>"$LOG_FILE"
