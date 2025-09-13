#!/bin/bash
# This script reads a configuration file (key=value format)
# and prints each key/value pair to the terminal.

# Name of the configuration file to read
CONFIG_FILE="config.txt"

# Check if the configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file does not exist."
    exit 1
fi

# Read the file line by line, splitting on '='
# IFS='=' sets the delimiter to '='
# 'read -r key value' assigns text before '=' to 'key' and after '=' to 'value'
while IFS='=' read -r key value; do
    # Print each key/value pair found
    echo "Key:$key Value:$value"
done < "$CONFIG_FILE"
