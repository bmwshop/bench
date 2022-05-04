#!/bin/sh

IMG="effnet_bench"
NAME="tf"
if [ $# -lt 1 ]
then
	echo "use: get_data.sh data_dir"
	exit 1
fi
data_dir=$1
LDIR=/workspace/nvidia-examples

if [ ! -d $data_dir/download ]
then
  echo "downloading data"
  docker run --rm -v $data_dir:/data -w /workspace/nvidia-examples/build_imagenet_data ${IMG} sh $LDIR/build_imagenet_data/download_and_preprocess_imagenet.sh $1
 # docker container exec ${NAME} $LDIR/build_imagenet_data/download_and_preprocess_imagenet.sh
 # docker run --rm -v $data_dir:/data foo python3 $LDIR/build_imagenet_data/download_and_preprocess_imagenet.sh
  #docker run --rm -v $data_dir:/data foo python3 $LDIR/data/bertPrep.py --action download --dataset google_pretrained_weights
else
  echo "data is already downloaded"
fi

#if [ ! -d $data_dir/google ]
#then
#	mkdir -p $data_dir/google
#fi
#if [ ! -f $data_dir/google/electra_base.zip ]
#then
#	wget https://storage.googleapis.com/electra-data/electra_base.zip -O /data/google/electra_base.zip
#fi


#if [ ! -f $data_dir/DLE_BERT_FP16_PyT_LAMB_92_hard_scaling_node.pt ]
#then
#  echo "downloading the pre-trained checkpoint"
#else
#  echo "checkpoint is already present"
#fi
