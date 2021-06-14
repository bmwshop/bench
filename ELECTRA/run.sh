#!/bin/sh


IMG="electra_bench"
WEIGHTS=None
SCRIPT=scripts/run_squad.sh

if [ $# -lt 5 ]
then
	echo "use: run.sh data_dir ngpus train_batch infer_batch epochs precision"
	exit 1
fi
data_dir=$1
GPUS=$2
BATCH=$3
INFER_BATCH=$4
EPOCHS=$5
PRECISION=$6

SQUAD_DIR="/data/download/squad/v1.1"
OUT_DIR="/data/BERT/results/SQuaD"
CACHE_DIR="/data/cache"
MODE="train_eval"
MODEL="google/electra-base-discriminator"
LR=4e-4
# INFER_BATCH=128
SEED=1
SQUAD_VERSION=1.1
ienv="interactive"
MAX_STEPS=-1



# bash scripts/benchmark_squad.sh train 1 16 16 amp v1.1 /data/download/squad/v1.1 /data/results None /data/cache


docker run --rm --gpus all -v $data_dir:/data --entrypoint="" -ti ${IMG} bash -c "${SCRIPT} ${MODEL} ${EPOCHS} ${BATCH} ${INFER_BATCH} ${LR} ${PRECISION} ${GPUS} ${SEED} ${SQUAD_VERSION} ${SQUAD_DIR} ${OUT_DIR} ${WEIGHTS} ${MODE} ${ienv} ${CACHE_DIR} ${MAX_STEPS}"

# ${MODE} ${GPUS} ${BATCH} ${BATCH} ${PRECISION} v1.1 ${SQUAD_DIR} ${OUT_DIR} ${WEIGHTS} ${CACHE_DIR}"

# example: sh run.sh ~/data 1 16 amp
