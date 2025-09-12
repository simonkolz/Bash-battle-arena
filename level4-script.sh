#!/bin/bash
#
# Simple Backup Script
# --------------------
# This script creates a "Backup" directory and checks if "hero.txt" exists.
# If it does, it copies all .txt files into the Backup directory.
# Otherwise, it reports that the task is incomplete.
#

# Create a Backup directory
mkdir -p Backup

# Check if hero.txt exists in the current directory
if [ -e "./hero.txt" ]; then
    cp *.txt Backup/
    echo "Task complete: .txt files copied to Backup/"
else
    echo "Task incomplete: hero.txt not found"
fi
