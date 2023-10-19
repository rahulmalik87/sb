#!/bin/bash

# MySQL connection details
MYSQL_USER="root"
MYSQL_PASSWORD="your_mysql_password"

# Function to drop the tablespace
drop_tablespace() {
  local tablespace_name="$1"
  mysql -u $MYSQL_USER -s $SOCKET -e "ALTER TABLE $tablespace_name DISCARD TABLESPACE;"
}

# Tablespaces to be dropped
tablespaces=("tt_1" "tt_2" "tt_3" "tt_4" "tt_5" "tt_1_fk" "tt_2_fk" "tt_3_fk" "tt_4_fk" "tt_5_fk")

# Loop through the tablespaces and drop each one
for tablespace in "${tablespaces[@]}"; do
  drop_tablespace "$tablespace"
done

