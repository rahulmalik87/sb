export WSREP_PROVIDER=/home/rahul/MySQL/build/o87/lib/libgalera_smm.so
#export PATH="/home/rahul/MySQL/build/o84/bin:$PATH"
if [ -z "$1" ]
then
  export WORKDIR=$HOME/workdir/$BX/1
  export CONTAINER_ID=${BX}1
else
  export WORKDIR=$HOME/workdir/$BX/$1
  export CONTAINER_ID=${BX}$1
fi
