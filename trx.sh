cd $TEST_PATH

$HOME/MySQL/src/pstress/bld/src/pstress-ms --no-tbs --no-enc --only-cl-sql --log-all-queries --seed 40  --config-file /home/rahulmalik/MySQL/src/sb/trx.cfg --no-partition-tables --no-temp-tables --fk-prob 0 --pk-prob 100 --records 50000 --seconds 10000 --exact-initial-records  --savepoint-prob-k=100  --tables  7 --columns 15 --no-blob --no-virtual --no-table-compression --row-format=none --log-all-queries --log-query-duration  --delete-with-cond 1000 --update=1000  --insert=1000  --indexes 4 --trx-prob-k=1000 --commit-prob=95

