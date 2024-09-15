export WSREP_PROVIDER=/home/rahul/MySQL/build/o89/lib/libgalera_smm.so
export PATH="/home/rahul/MySQL/build/x8/bin:$PATH"
if [ -z "$1" ]
then
  export WORKDIR=$HOME/workdir/$BX/1
  export CONTAINER_ID=${BX}1
else
  export WORKDIR=$HOME/workdir/$BX/$1
  export CONTAINER_ID=${BX}$1
fi
