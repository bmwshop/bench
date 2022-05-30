#!/bin/bash
# Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
#1x8x4 DGX1V - 1 epoch of training

# modified by Dima Rekesh 05/29/2022

# use: train_benchmark_mod.sh <precision> <n_gpus> <NHWC True/False> <Hybrid Dataloader True/False> <batch size> <learning rate>

BATCH=$5
LR=$6
GPU=$2
GLOBAL_BATCH=$(($5 * $2))
CONFIG='configs/e2e_mask_rcnn_R_50_FPN_1x.yaml'
RESULTS='/results'
LOGFILE="$RESULTS/joblog.log"
DTYPE="$1"
NHWC=$3

if ! [ -d "$RESULTS" ]; then mkdir $RESULTS; fi

python -m torch.distributed.launch --nproc_per_node=$GPU tools/train_net.py \
        --config-file $CONFIG \
        --skip-test \
        SOLVER.BASE_LR $LR \
        SOLVER.MAX_ITER 500 \
        SOLVER.STEPS "(30000, 40000)" \
        SOLVER.IMS_PER_BATCH $GLOBAL_BATCH \
        DTYPE "$DTYPE" \
        NHWC $3 \
        DATALOADER.HYBRID $4 \
        OUTPUT_DIR $RESULTS \
        | tee $LOGFILE

time=`cat $LOGFILE | grep -F 'maskrcnn_benchmark.trainer INFO: Total training time' | tail -n 1 | awk -F'(' '{print $2}' | awk -F' s ' '{print $1}' | egrep -o [0-9.]+`
statement=`cat $LOGFILE | grep -F 'maskrcnn_benchmark.trainer INFO: Total training time' | tail -n 1`
calc=$(echo $time 1.0 $GLOBAL_BATCH | awk '{ printf "%f", $2 * $3 / $1 }')
echo "Training perf is: "$calc" FPS"
