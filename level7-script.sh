#!/bin/bash
#
# Text File Size Listing Script
# -----------------------------
# This script checks if a directory exists (default: current directory).
# If it exists, it finds all .txt files, lists them with sizes,
# sorts them by size, and prints the size alongside the filename.
#

# Define the directory to search
DIRECTORY="./"

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Directory does not exist"
    exit 1
fi

# Find .txt files, list details, sort by size, and print size + filename
find "$DIRECTORY" -type f -name "*.txt" -exec ls -lh {} + \
    | sort -k 5,5 -h \
    | awk '{ print $5, $9 }'
