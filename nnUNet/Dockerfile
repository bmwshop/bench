ARG FROM_IMAGE_NAME=nvcr.io/nvidia/pytorch:22.04-py3
FROM ${FROM_IMAGE_NAME}

ADD . /workspace/nnunet_pyt
WORKDIR /workspace/nnunet_pyt

RUN pip install --upgrade pip
RUN pip install --disable-pip-version-check -r requirements.txt
RUN pip install pytorch-lightning==1.0.0 --no-dependencies
RUN pip install monai==0.4.0 --no-dependencies
RUN pip install --extra-index-url https://developer.download.nvidia.com/compute/redist/ nvidia-dali-cuda110==0.30.0
RUN pip install torch_optimizer==0.0.1a15 --no-dependencies
RUN pip install scikit-image
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip -qq awscliv2.zip
RUN ./aws/install
RUN rm -rf awscliv2.zip aws
RUN git clone https://github.com/NVIDIA/DeepLearningExamples.git
WORKDIR /workspace/nnunet_pyt/DeepLearningExamples/PyTorch/Segmentation/nnUNet
RUN mkdir /results
