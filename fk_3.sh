cd $TEST_PATH

$HOME/MySQL/src/pstress/bld/src/pstress-ms --no-tbs --no-enc --only-cl-sql --seed 10030 --config-file /home/rahulmalik/MySQL/src/sb/fk_3.cfg --no-partition-tables --no-temp-tables --fk-prob 100 --pk-prob 100  --exact-initial-records  --savepoint-prob-k=0 --no-table-compression --row-format=none --records 10000  --tables 10 --columns 7 --indexes 4 --update=1000  0 --insert 1000 --delete-with-cond 4 --commit-prob=100 --trx-prob-k 100 --trx-size=4 --seconds 10000 
