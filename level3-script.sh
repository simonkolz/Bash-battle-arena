#!/bin/bash
#
# Hero File Check Script
# ----------------------
# This script checks if "hero.txt" exists in the current directory.
# If the file exists, it prints a success message.
# Otherwise, it reports that the file is missing.


# Define the file name
file="hero.txt"

# Check if the file exists
if [ -e "./$file" ]; then
    echo "Hero file found!"
else
    echo "Hero file missing!"
fi
