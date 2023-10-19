!/bin/bash

# Function to display usage
function display_usage() {
    echo "Usage: $0 <script_name> <timeout_in_seconds>"
    echo "Example: $0 script.sh 60"
    exit 1
}

# Function to cleanup and exit
function cleanup() {
    echo "Cleaning up and terminating any running scripts..."
    kill $(jobs -p) 2>/dev/null
    exit 1
}

# Register the cleanup function for SIGINT signal (Ctrl-C)
trap cleanup SIGINT

# Check if both script name and timeout arguments are provided
if [ $# -ne 2 ]; then
    display_usage
fi

script_name="$1"
base_timeout="$2"
timeout_multiplier=1.05

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
    timeout "$adjusted_timeout" ./"$script_name" &

    # Save the PID of the background process
    script_pid=$!

    # Wait for the script to finish or be interrupted by timeout or Ctrl-C
    wait $script_pid

    # Check the exit status of the script
    exit_status=$?

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

