ARG FROM_IMAGE_NAME=nvcr.io/nvidia/pytorch:21.11-py3
FROM ${FROM_IMAGE_NAME}

ADD . /workspace/nnunet_pyt
WORKDIR /workspace/nnunet_pyt

RUN pip install --upgrade pip
RUN pip install --disable-pip-version-check -r requirements.txt

RUN pip install monai==0.8.1 --no-dependencies
RUN pip uninstall -y torchtext
RUN pip install numpy --upgrade

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip -qq awscliv2.zip
RUN ./aws/install
RUN rm -rf awscliv2.zip aws


RUN git clone https://github.com/NVIDIA/DeepLearningExamples.git

WORKDIR /workspace/nnunet_pyt/DeepLearningExamples/PyTorch/Segmentation/nnUNet
RUN mkdir /results
