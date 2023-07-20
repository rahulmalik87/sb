#!/bin/bash

# Function to display usage
function display_usage() {
    echo "Usage: $0 <gdb_file> <mysqld_executable> <bugs_file>"
    echo "Example: $0 core_dump.gdb /path/to/mysqld bugs.txt"
    exit 1
}

# Check if all three arguments are provided
if [ $# -ne 3 ]; then
    display_usage
fi

gdb_file="$1"
mysqld_executable="$2"
bugs_file="$3"

# Check if the GDB file exists
if [ ! -f "$gdb_file" ]; then
    echo "Error: GDB file '$gdb_file' not found."
    exit 1
fi

# Check if the mysqld executable exists
if [ ! -x "$mysqld_executable" ]; then
    echo "Error: mysqld executable '$mysqld_executable' not found or not executable."
    exit 1
fi

# Check if the bugs file exists
if [ ! -f "$bugs_file" ]; then
    echo "Error: Bugs file '$bugs_file' not found."
    exit 1
fi

# Create a temporary GDB script
tmp_gdb_script=$(mktemp)
echo "set pagination off" >> "$tmp_gdb_script"
echo "set confirm off" >> "$tmp_gdb_script"
echo "file $mysqld_executable" >> "$tmp_gdb_script"
echo "core-file $gdb_file" >> "$tmp_gdb_script"
echo "bt" >> "$tmp_gdb_script"
echo "quit" >> "$tmp_gdb_script"

# Extract the stack trace using GDB
stack_trace=$(gdb -batch -x "$tmp_gdb_script")

# Clean up the temporary GDB script
rm "$tmp_gdb_script"

# Function to check if the stack trace matches any bug ID signature
function check_for_bugs() {
    local stack_trace="$1"
    local bugs_file="$2"

    while IFS= read -r line; do
        local bug_id=$(echo "$line" | awk '{print $1}')
        local signature=$(echo "$line" | awk '{$1=""; print}')

        if echo "$stack_trace" | grep -E -q "$signature"; then
            echo "Found matching bug ID: $bug_id"
        fi
    done < "$bugs_file"
}

# Call the function to check for bugs in the stack trace
check_for_bugs "$stack_trace" "$bugs_file"

