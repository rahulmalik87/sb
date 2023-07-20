#!/bin/bash

# Function to display usage
function display_usage() {
    echo "Usage: $0 <script_name> <timeout_in_seconds>"
    echo "Example: $0 script.sh 60"
    exit 1
}

# Check if both script name and timeout arguments are provided
if [ $# -ne 2 ]; then
    display_usage
fi

script_name="$1"
timeout="$2"

# Function to check if any core files exist in /tmp
function check_for_core_files() {
    if ls /tmp/core* 1> /dev/null 2>&1; then
        echo "Core file(s) found in /tmp directory. Exiting without retry."
        exit 1
    fi
}

# Run the script with timeout
while true; do
    # Check for core files before running the script
    check_for_core_files

    # Run the script with timeout
    timeout "$timeout" ./"$script_name"

done

