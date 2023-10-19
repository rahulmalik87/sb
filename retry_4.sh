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
base_timeout="$2"
timeout_multiplier=1.0

# Function to check if any core files exist in /tmp
function check_for_core_files() {
    if ls /tmp/core* 1> /dev/null 2>&1; then
        echo "Core file(s) found in /tmp directory. Exiting without retry."
        exit 1
    fi
}

# Log all output to /tmp/current_run.log
exec &> >(tee -a /tmp/current_run.log)

# Run the script with timeout
while true; do
    # Check for core files before running the script
    check_for_core_files

    # Calculate the adjusted timeout for this iteration
    adjusted_timeout=$(bc <<< "$base_timeout * $timeout_multiplier")

    # Output the current timeout
    echo "Current timeout: $adjusted_timeout seconds"

    # Run the script with adjusted timeout and log the output
    timeout "$adjusted_timeout" ./"$script_name"

    # Check the exit status of the script
    exit_status=$?

    # If the script completed successfully, break the loop
    if [ $exit_status -eq 0 ]; then
        echo "Script completed before timeout."
        break
    fi

    # If the script was terminated due to the timeout, continue the loop
    if [ $exit_status -eq 124 ]; then
        echo "Script timed out. Retrying..."

        # Increase the timeout for the next retry
        timeout_multiplier=$(bc <<< "$timeout_multiplier + 0.05")
    else
        echo "Script exited with an error. Exiting without retry."
        exit 1
    fi
done

