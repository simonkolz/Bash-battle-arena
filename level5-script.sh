#!/bin/bash
#
# Battlefield and Archive Script
# ------------------------------
# This script creates a "Battlefield" directory with three character files.
# If "knight.txt" exists, it moves the file into an "Archive" directory,
# lists the contents of both directories, and prints a success message.
# Otherwise, it reports that the task is incomplete.
#

# Create the Battlefield directory and character files
mkdir -p Battlefield
touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt

# Check if knight.txt exists in Battlefield
if [ -e Battlefield/knight.txt ]; then
    mkdir -p Archive
    mv Battlefield/knight.txt Archive
    ls Battlefield Archive
    echo "Task complete, well done Simon"
else
    echo "Task is incomplete"
fi
