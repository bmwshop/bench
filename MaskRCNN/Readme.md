## MaskRCNN benchmark


This is a simple orchestration around the [MaskRCNN DL Example](https://github.com/NVIDIA/DeepLearningExamples/tree/master/PyTorch/Segmentation/MaskRCNN)

Build the container:
```
sh build.sh
```
Now, run the benchmark:
```
sh run.sh n_gpus global_batch learning_rate precision
When batch sizes are low, you may want to reduce the learning rate to prevent divergence
# on a 1-GPU 16 GB system:
# sh run.sh 1 10 0.004 float16
# sh run.sh 1 10 0.0004 float32
```
