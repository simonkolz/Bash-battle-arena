#!/bin/bash
# This script checks the disk usage of a given directory
# and compares it against a defined threshold.

# Directory to check (default is current directory)
DIRECTORY="./"

# Threshold in MB (if usage exceeds this, a warning is shown)
THRESHOLD=1

# Get disk usage of the directory in MB
# 'du -sm' shows size in MB, 'awk' extracts just the number
USAGE=$(du -sm "$DIRECTORY" | awk '{print $1}')

# Compare usage to threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    # If usage is greater, print a warning
    echo "Warning: Disk usage for $DIRECTORY is at $USAGE%!"
else
    # Otherwise, report that everything is fine
    echo "Disk usage for $DIRECTORY is at $USAGE%. All is well."
fi
