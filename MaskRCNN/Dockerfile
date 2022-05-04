FROM nvcr.io/nvidia/pytorch:22.04-py3

RUN apt update && apt install -y git

WORKDIR /

RUN git clone  https://github.com/NVIDIA/DeepLearningExamples.git

# root@0291d98955c9:/DeepLearningExamples/PyTorch/Segmentation/MaskRCNN# ./download_dataset.sh /datasets/data
WORKDIR /DeepLearningExamples/PyTorch/Segmentation/MaskRCNN
RUN mkdir -p /datasets/data
RUN pip install dtrx
RUN ./download_dataset.sh /datasets/data
WORKDIR /DeepLearningExamples/PyTorch/Segmentation/MaskRCNN/pytorch

# GPU=1
# GLOBAL_BATCH=10
# RUN sed -i "s/GPU=8/GPU=1/g" scripts/train_benchmark.sh
# RUN sed -i "s/GLOBAL_BATCH=32/GLOBAL_BATCH=10/g" scripts/train_benchmark.sh

