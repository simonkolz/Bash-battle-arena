#!/bin/bash
# This script provides a simple menu for system information:
# - Check disk space
# - Show system uptime
# - List system users

# Display menu options
echo "Choose an option:"
echo "1. Check disk space"
echo "2. Show system uptime"
echo "3. List users"

# Prompt the user for input
read -rp "Enter your choice [1-3]: " choice

# Process the user's choice using case
case $choice in
    1) 
        # Option 1: Show disk space in human-readable format
        df -h 
        ;;
    2) 
        # Option 2: Show system uptime
        uptime 
        ;;
    3) 
        # Option 3: List all users from /etc/passwd
        cut -d: -f1 /etc/passwd 
        ;;
    *) 
        # Default case: invalid input
        echo "Invalid option" 
        ;;
esac
