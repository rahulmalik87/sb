#!/bin/bash

# Function to display usage
function display_usage() {
    echo "Usage: $0 <script_name> <timeout_in_seconds> <log_directory>"
    echo "Example: $0 script.sh 60 /path/to/log_directory"
    exit 1
}

# Check if all three arguments are provided
if [ $# -ne 3 ]; then
    display_usage
fi

script_name="$1"
timeout="$2"
log_directory="$3"

# Function to check if any core files exist in /tmp
function check_for_core_files() {
    if ls /tmp/core* 1> /dev/null 2>&1; then
        echo "Core file(s) found in /tmp directory. Exiting without retry."
        exit 1
    fi
}

# Function to check for error messages in log files
function check_for_errors_in_logs() {
    local log_files=( "$log_directory"/mysqld.*.err )

    for file in "${log_files[@]}"; do
        if grep -q "ERROR" "$file"; then
            echo "Error message found in $file:"
            grep "ERROR" "$file"
            exit 1
        fi
    done
}

# Function to run the script and check for "ERROR" in the output
function run_script_with_timeout() {
    # Capture the script output and store it in a variable
    script_output=$(timeout "$timeout" ./"$script_name" 2>&1)

    # Check if "ERROR" is present in the output
    if echo "$script_output" | grep -q "ERROR"; then
        echo "ERROR message found in the script output:"
        echo "$script_output"
        exit 1
    fi
}

# Run the script with timeout
while true; do
    # Check for core files before running the script
    check_for_core_files

    # Check for error messages in log files
    check_for_errors_in_logs

    # Run the script with timeout and check for "ERROR" in the output
    run_script_with_timeout

done

