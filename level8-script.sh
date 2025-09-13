#!/bin/bash
#
# Word Search Script
# ------------------
# This script looks through all .txt files in the current directory
# and lists the ones that contain a specific word.
#

# Define the directory and the word to search
DIRECTORY="./"
WORD="a"

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Directory does not exist"
fi

# Search for the word inside .txt files and list matching filenames
grep -l "$WORD" "$DIRECTORY"*.txt
