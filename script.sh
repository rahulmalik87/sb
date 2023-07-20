cd $TEST_PATH
./mtr --suite=galera_3nodes --start-and-exit

echo "running pstress" 
$HOME/MySQL/src/pstress/bld/src/pstress-ms  --no-enc --no-ddl --seconds 3000   --records 3000 --primary-key-probability=100 --only-cl-sql --update=100  --indexes=0 --log-all-queries  --seed 40 --savepoint-prb-k=0 --trx-prb-k=0 --config-file /home/rahulmalik/MySQL/src/sb/pstress.cfg --delete-with-cond 1 --insert=1000 --table 10 --no-partition-tables --no-temp-tables
