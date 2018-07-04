DATA_PATH=/mnt/disks/git-data/gitea
HOST=git.nmtuan.space

mkdir -p $DATA_PATH/conf
cp app.ini $DATA_PATH/conf

mkdir -p $DATA_PATH/conf/credentials
(cd $DATA_PATH/conf/credentials && gitea cert --host $HOST)

cp -r public $DATA_PATH
cp -r templates $DATA_PATH
