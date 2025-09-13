#!/bin/bash
#
# Directory Change Logger
# -----------------------
# This script monitors a directory for file changes (create, modify, delete).
# All detected changes are logged with a timestamp into "change_log.txt".
#

# Directory to monitor
DIRECTORY="./"

# Log file to store changes
LOG_FILE="change_log.txt"

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo  "Directory does not exist."
    exit 1
fi

# Monitor the directory and log changes
fswatch -r "$DIRECTORY" | while read event; do
    if [ -e "$event" ]; then
        echo "$(date +'%Y-%m-%d %H:%M:%S') File modified/created: $event" >> "$LOG_FILE"
    else
        echo "$(date +'%Y-%m-%d %H:%M:%S') File deleted: $event" >> "$LOG_FILE"
    fi
done
