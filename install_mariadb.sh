mkdir /Users/rahulmalik/MySQL/src/o84/bld/runtime_output_directory
ln -s $HOME/Mysql/build/$BOX/bin/mysql /Users/rahulmalik/MySQL/src/o84/bld/runtime_output_directory/mysql
 ln -s /Users/rahulmalik/MySQL/build/o84/bin/mysqld /Users/rahulmalik/MySQL/src/o84/bld/runtime_output_directory/mysqld

rm -rf $DATADIR && mkdir $DATADIR  && cd $HOME/MySQL/build/o84  && `f mysql_install_db` --datadir $DATADIR --no-defaults
export MO=$MO" --skip-grant-tables"
