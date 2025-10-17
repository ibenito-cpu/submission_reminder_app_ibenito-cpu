#!/bin/bash

# copilot_shell_script.sh
# This script updates the ASSIGNMENT value in config/config.env and reruns startup.sh

# Prompt user for the new assignment name
read -p "Enter the new assignment name: " new_assignment

CONFIG_FILE=$(find . -type f -name "config.env")

# Check if config.env exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: $CONFIG_FILE not found."
    exit 1
fi

# Update the ASSIGNMENT value in config.env
if grep -q "^ASSIGNMENT=" "$CONFIG_FILE"; then
    sed -i "s|^ASSIGNMENT=.*$|ASSIGNMENT=\"$new_assignment\"|" "$CONFIG_FILE"
else
    # If ASSIGNMENT is not present, add it
    echo "ASSIGNMENT=$new_assignment" >> "$CONFIG_FILE"
fi

# Find the directory containing config.env and run the correct startup.sh
app_dir="$(dirname "$(dirname "$CONFIG_FILE")")"

# Move to the App Directory and Run startup.sh to check student submission status for new assignment
cd $app_dir
./startup.sh
