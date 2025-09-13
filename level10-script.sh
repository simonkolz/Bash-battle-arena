#!/bin/bash
# This script creates files in Arena_Boss, fills them with random lines,
# shows them sorted by size, and moves any containing "Victory" to Victory_Archive.

# Create a directory to hold the files
mkdir Arena_Boss

# Loop to create 5 files (file1.txt ... file5.txt)
for i in {1..5}
do
    FILE="Arena_Boss/file$i.txt"
    # Pick a random number of lines between 10 and 20
    LINES=$((RANDOM % 11 + 10))
    # Generate that many lines in each file
    for j in $(seq 1 $LINES)
    do
        echo "This is line $j" >> "$FILE"
    done
done

# Show all files sorted by size
echo "Files sorted by size:"
find Arena_Boss -type f -exec ls -lh {} + | sort -k 5,5 -h

# Create archive folder for files containing the word "Victory"
mkdir -p Victory_Archive
for FILE in Arena_Boss/*.txt
do
    # Check if file contains "Victory"
    if grep -q "Victory" "$FILE"; then
        # If yes, move the file to Victory_Archive
        mv "$FILE" Victory_Archive/
        echo "$FILE contains 'Victory' and has been moved to Victory_Archive."
    else
        # If not, print a message
        echo " there was no files to move since Victory was not found"
    fi
done
