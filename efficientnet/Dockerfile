FROM nvcr.io/nvidia/tensorflow:22.04-tf2-py3

RUN apt update && apt install -y git wget bzip2 pv bzip2 cabextract

RUN git clone https://github.com/NVIDIA/DeepLearningExamples.git

WORKDIR /workspace/DeepLearningExamples/TensorFlow2/Classification/ConvNets/efficientnet
COPY train_benchmark_2xRTX8000-48G.sh /workspace/DeepLearningExamples/TensorFlow2/Classification/ConvNets/efficientnet/scripts/B0/training/AMP/

# RUN mkdir /results
RUN pip install wget


# RUN ln -s /workspace/DeepLearningExamples/TensorFlow2/LanguageModeling/ELECTRA /workspace/electra
# RUN chmod a+x scripts/run_squad.sh
