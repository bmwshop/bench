#!/bin/sh

IMG="bert_bench"
WEIGHTS=bert_base.pt
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

PRECISION=""
if [ "$4" = "fp16" ]
then
  PRECISION="--fp16"
fi
# PRECISION=$4

# BERT_MODEL="bert-large-uncased"
BERT_MODEL="bert-base-uncased"
SQUAD_DIR="/data/download/squad/v1.1"
VOCAB_FILE="/data/download/google_pretrained_weights/uncased_L-12_H-768_A-12/vocab.txt"
#VOCAB_FILE="/data/download/google_pretrained_weights/uncased_L-24_H-1024_A-16/vocab.txt"
CONFIG_FILE="/data/download/google_pretrained_weights/uncased_L-12_H-768_A-12/bert_config.json"

OUT_DIR="/data/BERT/results/SQuaD"
MODE=train
# CONFIG_FILE=bert_config.json
MAX_STEPS=-1


# scripts/run_squad.sh /workspace/checkpoints/DLE_BERT_FP16_PyT_LAMB_92_hard_scaling_node.pt 2.0 10 3e-5 fp16 2

# docker run --rm --gpus ${GPUS} -v $data_dir:/data --entrypoint="" -ti foo sh -c "${SCRIPT} /data/${WEIGHTS} ${EPOCHS} ${BATCH} ${LR} ${PRECISION} ${GPUS} ${SEED} ${SQUAD_DIR} ${VOCAB_FILE} ${OUT_DIR} ${MODE} ${CONFIG_FILE} ${MAX_STEPS}" 

docker run --rm --gpus ${GPUS} -v $data_dir:/data --entrypoint="" -ti ${IMG} sh -c "python run_squad.py --init_checkpoint=/data/${WEIGHTS} --do_train --train_file=${SQUAD_DIR}/train-v1.1.json --train_batch_size=${BATCH}  --do_lower_case  --bert_model=${BERT_MODEL}  --learning_rate=${LR}  --seed=${SEED}  --num_train_epochs=${EPOCHS}  --max_seq_length=384  --doc_stride=128  --output_dir=${OUT_DIR}  --vocab_file=${VOCAB_FILE}  --config_file=${CONFIG_FILE}  --max_steps=-1 ${PRECISION}  |& tee ${OUT_DIR}/logfile.txt"


# example: sh run.sh ~/data 1 10 fp16
