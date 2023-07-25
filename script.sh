#!/bin/bash

# Change to the test directory
cd "$TEST_PATH"

# Start the mtr test suite
./mtr --suite=galera_3nodes --start-and-exit

echo "running pstress"

# Generate a random seed based on the current time
RANDOM_SEED=$(date +%s)

# Save the seed as a comment
echo "# Random seed: $RANDOM_SEED"

# Run the pstress command with the generated random seed
$HOME/MySQL/src/pstress/bld/src/pstress-ms --no-enc --no-ddl --seconds 3000 --records 3000 --primary-key-probability=100 --only-cl-sql --update=100 --indexes=0 --log-all-queries --seed "$RANDOM_SEED" --savepoint-prb-k=0 --trx-prb-k=0 --config-file /home/rahulmalik/MySQL/src/sb/pstress.cfg --delete-with-cond 1 --insert=1000 --table 10 --no-partition-tables --no-temp-tables

