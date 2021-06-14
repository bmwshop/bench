#!/bin/sh

IMG="nnunet_bench"
if [ $# -lt 1 ]
then
	echo "use: get_data.sh data_dir"
	exit 1
fi
data_dir=$1

docker run --rm --gpus all -v $data_dir:/data ${IMG} python download.py --task 01

docker run --rm --gpus all -v $data_dir:/data ${IMG} python preprocess.py --task 01 --dim 3
docker run --rm --gpus all -v $data_dir:/data ${IMG} python preprocess.py --task 01 --dim 2
