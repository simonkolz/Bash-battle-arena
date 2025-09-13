#!/bin/bash
# This script provides a system menu with four options:
# 1. Check disk space
# 2. Show system uptime
# 3. Backup the Arena directory
# 4. Parse a configuration file

# Display menu options
echo "Choose an option:"
echo "1. Check disk space"
echo "2. Show system uptime"
echo "3. Backup Arena directory"
echo "4. Parse configuration file"

# Prompt user for input
read -rp "Enter your choice [1-4]: " choice

# Handle menu selection
case $choice in
    1)
        # Option 1: Show disk usage in human-readable format
        df -h
        ;;
    2)
        # Option 2: Show how long the system has been running
        uptime
        ;;
    3)
        # Option 3: Backup Arena directory

        # Define source directory (current directory) and backup location
        SOURCE_DIR="./"
        BACKUP_DIR="Backups_2"

        # Create backup directory if it doesn’t exist
        mkdir -p "$BACKUP_DIR"

        # Generate a timestamped backup file name
        TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
        BACKUP_NAME="backup2_$TIMESTAMP.tar.gz"

        # Create a compressed tarball of the source directory
        tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"
        echo "Created backup 2: $BACKUP_NAME"

        # Move into the backup directory
        cd "$BACKUP_DIR" || exit

        # Keep only the 5 most recent backups
        # 'ls -t' sorts by time (newest first), 'sed -e "1,5d"' skips first 5,
        # and the loop deletes all older backups
        ls -t | sed -e '1,5d' | while IFS= read -r file; do
            rm -f "$file"
        done
        ;;
    4)
        # Option 4: Parse configuration file in key=value format

        CONFIG_FILE="config.txt"

        # Check if configuration file exists
        if [ ! -f "$CONFIG_FILE" ]; then
            echo "Configuration file does not exist."
            exit 1
        fi

        # Read file line by line, splitting on '='
        while IFS='=' read -r key value; do
            echo "Key: $key, Value: $value"
        done < "$CONFIG_FILE"
        ;;
    *)
        # Default: invalid choice
        echo "Invalid option"
        ;;
esac
