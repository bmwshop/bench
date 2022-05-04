ARG FROM_IMAGE_NAME=nvcr.io/nvidia/tensorflow:22.04-tf2-py3
FROM ${FROM_IMAGE_NAME}

RUN apt update && apt install -y git wget bzip2 pv bzip2 cabextract

RUN git clone https://github.com/NVIDIA/DeepLearningExamples.git

WORKDIR /workspace/DeepLearningExamples/TensorFlow2/LanguageModeling/ELECTRA

# RUN mkdir /results
RUN pip install wget

ENV BERT_PREP_WORKING_DIR /data

RUN pip install --upgrade --no-cache-dir pip \
 && pip install --no-cache-dir \
 tqdm boto3 requests six ipdb h5py html2text nltk progressbar filelock tokenizers==0.7.0 \
 git+https://github.com/NVIDIA/dllogger \
 nvidia-ml-py3==7.352.0

RUN chmod a+x scripts/benchmark_squad.sh
RUN ln -s /workspace/DeepLearningExamples/TensorFlow2/LanguageModeling/ELECTRA /workspace/electra
RUN chmod a+x scripts/run_squad.sh
