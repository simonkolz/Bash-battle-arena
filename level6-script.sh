#!/bin/bash
#
# File Line Count Script
# ----------------------
# This script takes a filename as an argument.
# If the file exists, it prints the number of lines
# and confirms that the filename was accepted.
# Otherwise, it reports that no file was provided.
#

# Take the first argument as the filename
file=$1

# Check if the file exists
if [ -e "./$file" ]; then
    wc -l "$file"
    echo "Filename accepted"
else
    echo "No file provided"
fi
