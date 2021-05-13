#!/bin/sh


if [ $# -lt 4 ]
then
	echo "use: run.sh data_dir ngpus batch ndim [--amp]"
	exit 1
fi
data_dir=$1
ngpus=$2
batch=$3
ndim=$4
amp=""

if [ $# -eq 5 ]
then
  amp="--amp"
fi

docker run --rm --gpus all -v $data_dir:/data --entrypoint="" -ti foo sh -c "time python -u scripts/benchmark.py --mode train --gpus $ngpus --dim $ndim --batch_size $batch $amp" 
