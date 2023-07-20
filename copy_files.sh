#!/bin/bash

# Function to display usage
function display_usage() {
    echo "Usage: $0 <number> <log_directory>"
    echo "Example: $0 123 /path/to/log_directory"
    exit 1
}

# Check if both number and log directory arguments are provided
if [ $# -ne 2 ]; then
    display_usage
fi

N="$1"
LOG_DIR="$2"
SRC="/path/to/source/directory"  # Replace this with the actual path to the source directory

# 1) Create the main directory /home/rahulmalik/MySQL/bugs_N
main_dir="/home/rahulmalik/MySQL/bugs_$N"
mkdir -p "$main_dir"

# 2) Create the subdirectories core_executable and pstress_logs
core_dir="$main_dir/core_executable"
pstress_dir="$main_dir/pstress_logs"
mkdir -p "$core_dir" "$pstress_dir"

# 3) Copy $LOG_DIR/node* into pstress_logs
cp "$LOG_DIR"/node* "$pstress_dir"

# 4) Copy $LOG_DIR/core* into core_executable if it exists
if ls "$LOG_DIR"/core* 1> /dev/null 2>&1; then
    cp "$LOG_DIR"/core* "$core_dir"
fi

# 5) Copy $SRC/bld./plugin/galera_replication/galera/libgalera_smm.so into core_executable
cp "$SRC/bld./plugin/galera_replication/galera/libgalera_smm.so" "$core_dir"

# 6) Copy $SRC/bld/./runtime_output_directory/mysqld into core_executable
cp "$SRC/bld/./runtime_output_directory/mysqld" "$core_dir"

