#!/bin/sh

# docker run --rm -v /home/nvidia/data:/data --gpus all --ipc=host -ti nvcr.io/nvidia/pytorch:21.04-py3 bash

docker run --rm --gpus all --ipc=host -ti nvcr.io/nvidia/pytorch:21.04-py3 bash
