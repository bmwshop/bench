#!/bin/sh


if [ $# -lt 1 ]
then
	echo "use: get_data.sh data_dir"
	exit 1
fi
data_dir=$1
LDIR=/workspace/DeepLearningExamples/PyTorch/LanguageModeling/BERT

if [ ! -d $data_dir/download ]
then
  echo "downloading data"
  docker run --rm -v $data_dir:/data foo python3 $LDIR/data/bertPrep.py --action download --dataset squad
  docker run --rm -v $data_dir:/data foo python3 $LDIR/data/bertPrep.py --action download --dataset google_pretrained_weights
else
  echo "data is already downloaded"
fi

if [ ! -f $data_dir/DLE_BERT_FP16_PyT_LAMB_92_hard_scaling_node.pt ]
then
  echo "downloading the pre-trained checkpoint"
  docker run --rm -v $data_dir:/data foo sh -c "wget --content-disposition https://api.ngc.nvidia.com/v2/models/nvidia/bert_pyt_ckpt_large_pretraining_amp_lamb/versions/19.07.0/zip -O /data/bert_pyt_ckpt_large_pretraining_amp_lamb_19.07.0.zip && unzip /data/bert_pyt_ckpt_large_pretraining_amp_lamb_19.07.0.zip -d /data && rm /data/bert_pyt_ckpt_large_pretraining_amp_lamb_19.07.0.zip" 
else
  echo "checkpoint is already present"
fi
