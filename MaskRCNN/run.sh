#!/bin/sh


if [ $# -lt 3 ]
then
	echo "use: run.sh ngpus global_batch float32/float16"
	exit 1
fi

# RUN sed -i "s/GPU=8/GPU=1/g" scripts/train_benchmark.sh
# RUN sed -i "s/GLOBAL_BATCH=32/GLOBAL_BATCH=10/g" scripts/train_benchmark.sh

F="scripts/train_benchmark.sh"
GPUS=$1
BATCH=$2
P=$3

docker run --rm --gpus all -ti foo sh -c "sed -i 's/GPU=8/GPU=$GPUS/g' $F;sed -i 's/GLOBAL_BATCH=32/GLOBAL_BATCH=$BATCH/g' $F;$F $P"
