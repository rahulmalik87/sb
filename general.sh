cd $TEST_PATH

$HOME/MySQL/src/pstress/bld/src/pstress-ms --no-tbs --no-enc --log-all-queries --seed 40  --config-file /home/rahulmalik/MySQL/src/sb/pstress.cfg --pk-prob 100 --records 5000 --seconds 10000 --exact-initial-records  --savepoint-prob-k=0  --tables  40 --columns 15 --no-delete  --update=1000  --insert=1000  --indexes 1 --select-single-row=1000 --trx-prob-k=10 --no-temp-tables
