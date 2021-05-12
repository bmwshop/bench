## MaskRCNN benchmark


This is a simple orchestration around the [MaskRCNN DL Example](https://github.com/NVIDIA/DeepLearningExamples/tree/master/PyTorch/Segmentation/MaskRCNN)

Build the container:
```
sh build.sh
```
Now, run the benchmark:
```
sh run.sh n_gpus global_batch precision
# on a 1-GPU 16 GB system:
# sh run.sh 1 10 float16
# sh run.sh 1 10 float32
```
