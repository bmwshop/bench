#!/bin/sh
IMG="effnet_bench"
CONTAINER_TF2x_BASE="nvcr.io/nvidia/tensorflow"
CONTAINER_TF2x_TAG="21.05-tf2-py3"

docker pull "${CONTAINER_TF2x_BASE}:${CONTAINER_TF2x_TAG}"

echo -e "\n\nBuilding Effnet_test Container\n\n"

sleep 1

docker build -t ${IMG} \
    --build-arg FROM_IMAGE_NAME="nvcr.io/nvidia/tensorflow:21.05-tf2-py3" \
    .
