#!/bin/sh


WEIGHTS=DLE_BERT_FP16_PyT_LAMB_92_hard_scaling_node.pt
SCRIPT=scripts/run_squad.sh
EPOCHS=1

if [ $# -lt 4 ]
then
	echo "use: run.sh data_dir ngpus batch precision"
	exit 1
fi
data_dir=$1
GPUS=$2
BATCH=$3
PRECISION=$4

# scripts/run_squad.sh /workspace/checkpoints/DLE_BERT_FP16_PyT_LAMB_92_hard_scaling_node.pt 2.0 10 3e-5 fp16 2

docker run --rm --gpus all -v $data_dir:/data --entrypoint="" -ti foo sh -c "${SCRIPT} /data/${WEIGHTS} ${EPOCHS} ${BATCH} ${LR} ${PRECISION} ${GPUS}
