ARG FROM_IMAGE_NAME=nvcr.io/nvidia/pytorch:21.11-py3
FROM ${FROM_IMAGE_NAME}

RUN apt install -y git wget

RUN git clone https://github.com/NVIDIA/DeepLearningExamples.git

WORKDIR /workspace/DeepLearningExamples/PyTorch/LanguageModeling/BERT

# RUN mkdir /results
RUN pip install --no-cache-dir \
 tqdm boto3 requests six ipdb h5py nltk progressbar onnxruntime==1.12.0 tokenizers>=0.7\
 git+https://github.com/NVIDIA/dllogger wget

ENV BERT_PREP_WORKING_DIR /data
# RUN python3 /workspace/bert/data/bertPrep.py --action download --dataset squad 

