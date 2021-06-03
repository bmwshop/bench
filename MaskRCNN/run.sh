#!/bin/sh


if [ $# -lt 4 ]
then
	echo "use: run.sh ngpus global_batch lr float32/float16"
	exit 1
fi

# RUN sed -i "s/GPU=8/GPU=1/g" scripts/train_benchmark.sh
# RUN sed -i "s/GLOBAL_BATCH=32/GLOBAL_BATCH=10/g" scripts/train_benchmark.sh

F="scripts/train_benchmark.sh"
GPUS=$1
BATCH=$2
LR=$3
P=$4

docker run --rm --gpus all --ipc=host -ti foo sh -c "sed -i 's/SOLVER.BASE_LR 0.04/SOLVER.BASE_LR ${LR}/g' $F;sed -i 's/GPU=8/GPU=$GPUS/g' $F;sed -i 's/GLOBAL_BATCH=32/GLOBAL_BATCH=$BATCH/g' $F;$F $P"
