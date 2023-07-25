
# Change to the test directory
cd "$TEST_PATH"

# Start the mtr test suite
./mtr --suite=galera_3nodes --start-and-exit

# sleep to ensure node is ready to accept connection

sleep 10

echo "running pstress"


# Generate a random seed based on the current time
RANDOM_SEED=$(date +%s)
echo "# Random seed: $RANDOM_SEED"


$HOME/MySQL/src/pstress/bld/src/pstress-ms --no-enc --no-ddl --seconds 3000 --only-cl-sql --indexes=10 --log-all-queries --seed $RANDOM_SEED --savepoint-prb-k=0 --trx-prb-k=0 --config-file /home/rahulmalik/MySQL/src/sb/pstress.cfg --update=1000 --table 10 --no-partition-tables --no-temp-tables --table 10 --columns 15  --seconds 10000 --fk-prob 100 --pk-prob 100 --records 5000000



