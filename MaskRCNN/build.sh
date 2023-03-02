#!/bin/sh

IMG="maskrcnn_bench"
docker build --no-cache -t ${IMG} .
