#!/bin/bash
# This script creates a compressed backup of a source directory
# and stores it in a "Backups" folder. After creating the backup,
# it removes all files in the backup directory.

# Source directory to back up (default is current directory)
SOURCE_DIR="./"

# Destination directory for backups
BACKUP_DIR="Backups"

# Check if the source directory exists
if [ -d "$SOURCE_DIR" ]; then
    echo "Arena exists"
else
    echo "Arena2 does not exist"
    exit 1
fi

# Create the backup directory if it doesn’t exist
mkdir -p "$BACKUP_DIR"

# Generate a timestamp for the backup file name
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Define the backup file name (with timestamp)
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# Create a compressed tarball backup of the source directory
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"
echo "Created backup: $BACKUP_NAME"

# Change into the backup directory
cd "$BACKUP_DIR" || exit

# List files sorted by modification time and delete them all
# (⚠ This will remove every backup file in the Backups directory)
ls -t | while IFS= read -r file; do
    rm -f "$file"
done
