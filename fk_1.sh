#!/bin/bash
# Function to generate a random number within a given range based on the seed
function generate_random_number() {
    local min=$1
    local max=$2

    awk -v "seed=$seed" -v "min=$min" -v "max=$max" 'BEGIN { srand(seed); print min + int(rand() * (max - min + 1)) }'
}

# Change to the test directory
cd "$TEST_PATH"

# Start the mtr test suite
./mtr --suite=galera_3nodes --start-and-exit

# sleep to ensure node is ready to accept connection

echo "running pstress"

# Seed value for the random number generator
seed=$(date +%s)
echo "# Random seed: $seed"

# Call the function to generate a random number within the range
table=$(generate_random_number 50 100)
column=$(generate_random_number 10 15)

echo "running for $table tables and $column columns "

$HOME/MySQL/src/pstress/bld/src/pstress-ms --no-tbs --no-enc --no-ddl --only-cl-sql --indexes=10 --log-all-queries --seed $seed --savepoint-prb-k=0 --trx-prb-k=1 --config-file /home/rahulmalik/MySQL/src/sb/pstress.cfg --update=1000 --no-partition-tables --no-temp-tables --table $table --columns $column --fk-prob 100 --pk-prob 100 --records 50 --seconds 10000 --exact-initial-records --columns 15 --insert 1000

# $HOME/MySQL/src/pstress/bld/src/pstress-ms --no-tbs --no-enc --no-ddl --only-cl-sql --indexes=10 --log-all-queries --seed 40 --savepoint-prb-k=0 --trx-prb-k=0 --config-file /home/rahulmalik/MySQL/src/sb/pstress.cfg --update=1000 --no-partition-tables --no-temp-tables --table 10 --columns 20 --seconds 10000 --fk-prob 100 --pk-prob 100 --records 50 --seconds 10000  --exact-initial-records --columns 15 --insert 1000
