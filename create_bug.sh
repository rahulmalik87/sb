#!/bin/bash

# Function to display usage
function display_usage() {
    echo "Usage: $0 <number> </path/to/log_directory>"
    echo "Example: $0 123 /path/to/logs"
    exit 1
}

# Check if both number and log directory arguments are provided
if [ $# -ne 2 ]; then
    display_usage
fi

N="$1"
LOG_DIRECTORY="$2"

# 1) Create the main directory /home/rahulmalik/MySQL/bugs_N
main_dir="/home/rahulmalik/MySQL/bugs/issue_$N"
mkdir -p "$main_dir"

# 2) Create the subdirectories core_executable and pstress_logs
core_dir="$main_dir/core_executable"
pstress_dir="$main_dir/pstress_logs"
mkdir -p "$core_dir" "$pstress_dir"

cp "$LOG_DIRECTORY"/*node* "$pstress_dir"

cp "$LOG_DIRECTORY"/step* "$pstress_dir"

# 4) Copy /path/to/log_directory/core* into core_executable if it exists
if ls "/tmp"/core* 1> /dev/null 2>&1; then
    cp "/tmp"/core* "$core_dir"
fi

cp /home/rahulmalik/MySQL/src/$BOX/bld/plugin/galera_replication/galera/libgalera_smm.so $core_dir
cp /home/rahulmalik/MySQL/src/$BOX/bld/runtime_output_directory/mysqld $core_dir

mkdir -p "$main_dir/data"
cp -r $SRC/bld/mysql-test/var/* $main_dir/data

cd "$SRC" 
git diff > "$main_dir/git_diff.patch"

# Append Git commit ID as a comment at the end of script.sh
echo "# Git source difference  commit ID: $(git rev-parse HEAD)" >> "$main_dir/script.sh"

cd /home/rahulmalik/MySQL/bugs

# 8) Tar and gzip the main directory
tar -czvf "issue_$N.tar.gz" "issue_$N"

echo "After confirming, please upload using aws s3 cp issue_$N.tar.gz  s3://codership-uploads" 

echo "Place where it would be upload https://codership-uploads.s3.eu-central-1.amazonaws.com/issue_$N.tar.gz"
