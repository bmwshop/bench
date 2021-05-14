#!/bin/sh


WEIGHTS=DLE_BERT_FP16_PyT_LAMB_92_hard_scaling_node.pt
SCRIPT=scripts/run_squad.sh
EPOCHS=1
LR=3e-5
SEED=1

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
VOCAB_FILE="/data/download/google_pretrained_weights/uncased_L-24_H-1024_A-16/vocab.txt"
OUT_DIR="/data/BERT/results/SQuaD"
MODE=train
CONFIG_FILE=bert_config.json
MAX_STEPS=-1


# scripts/run_squad.sh /workspace/checkpoints/DLE_BERT_FP16_PyT_LAMB_92_hard_scaling_node.pt 2.0 10 3e-5 fp16 2

docker run --rm --gpus all -v $data_dir:/data --entrypoint="" -ti foo sh -c "${SCRIPT} /data/${WEIGHTS} ${EPOCHS} ${BATCH} ${LR} ${PRECISION} ${GPUS} ${SEED} ${SQUAD_DIR} ${VOCAB_FILE} ${OUT_DIR} ${MODE} ${CONFIG_FILE} ${MAX_STEPS}" 

# example: sh run.sh ~/data 1 10 fp16
