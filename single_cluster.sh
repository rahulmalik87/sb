cd $TEST_PATH

$HOME/MySQL/src/pstress/bld/src/pstress-ms --no-tbs --no-enc --only-cl-sql --seed 130 --no-partition-tables --no-temp-tables --fk-prob 100 --pk-prob 100 --exact-initial-records  --savepoint-prob-k=0   --no-blob  --no-virtual --no-table-compression --no-table-compression --row-format=none --records 10000 --seconds 1000  --log-all-queries --tables 20 --columns 5 --indexes 4 --update=1000  --select-single-row 10 --insert 1000 --delete-with-cond 42 --commit-prob=14 --trx-prob-k 100 --trx-size=4 --log-query-duration --socket $SOCKET -uroot --threads  20
