ARG FROM_IMAGE_NAME=nvcr.io/nvidia/pytorch:22.01-py3
FROM ${FROM_IMAGE_NAME}

RUN apt install -y git wget

RUN git clone https://github.com/NVIDIA/DeepLearningExamples.git

WORKDIR /workspace/DeepLearningExamples/PyTorch/LanguageModeling/BERT

# RUN mkdir /results
RUN pip install wget boto3
RUN pip install git+https://github.com/NVIDIA/dllogger#egg=dllogger

ENV BERT_PREP_WORKING_DIR /data
# RUN python3 /workspace/bert/data/bertPrep.py --action download --dataset squad 

