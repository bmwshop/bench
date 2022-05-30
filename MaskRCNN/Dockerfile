FROM nvcr.io/nvidia/pytorch:21.12-py3

RUN apt update && apt install -y git

WORKDIR /

RUN git clone  https://github.com/NVIDIA/DeepLearningExamples.git

# root@0291d98955c9:/DeepLearningExamples/PyTorch/Segmentation/MaskRCNN# ./download_dataset.sh /datasets/data
WORKDIR /DeepLearningExamples/PyTorch/Segmentation/MaskRCNN
RUN mkdir -p /datasets/data
RUN pip install dtrx
# fix the train2017.zip hash
RUN wget -c http://images.cocodataset.org/zips/train2017.zip
RUN sed -i "s/^bdbcd258b8721a1af3c2ae200c3d89fb/cced6f7f71b7629ddf16f17bbcfab6b2/g" train2017.zip
RUN ./download_dataset.sh /datasets/data
WORKDIR /DeepLearningExamples/PyTorch/Segmentation/MaskRCNN/pytorch

RUN pip install -e .

RUN pip install --upgrade --no-cache-dir pip \
 && pip install --no-cache-dir \
      mlperf-compliance==0.0.10 \
      git+https://github.com/NVIDIA/dllogger \
      yacs

COPY  train_benchmark_mod.sh /DeepLearningExamples/PyTorch/Segmentation/MaskRCNN/pytorch/scripts/

# GPU=1
# GLOBAL_BATCH=10
# RUN sed -i "s/GPU=8/GPU=1/g" scripts/train_benchmark.sh
# RUN sed -i "s/GLOBAL_BATCH=32/GLOBAL_BATCH=10/g" scripts/train_benchmark.sh

