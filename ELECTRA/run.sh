#!/bin/sh


WEIGHTS=None
SCRIPT=scripts/benchmark_squad.sh

if [ $# -lt 4 ]
then
	echo "use: run.sh data_dir ngpus batch precision"
	exit 1
fi
data_dir=$1
GPUS=$2
BATCH=$3
PRECISION=$4

SQUAD_DIR="/data/download/squad/v1.1"
OUT_DIR="/data/BERT/results/SQuaD"
CACHE_DIR="/data/cache"
MODE="train"

# bash scripts/benchmark_squad.sh train 1 16 16 amp v1.1 /data/download/squad/v1.1 /data/results None /data/cache


docker run --rm --gpus all -v $data_dir:/data --entrypoint="" -ti foo bash -c "${SCRIPT} ${MODE} ${GPUS} ${BATCH} ${BATCH} ${PRECISION} v1.1 ${SQUAD_DIR} ${OUT_DIR} ${WEIGHTS} ${CACHE_DIR}"

# example: sh run.sh ~/data 1 16 amp
