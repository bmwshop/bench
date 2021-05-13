## MaskRCNN benchmark


This is a simple orchestration around the [nnUNet DL Example](https://github.com/NVIDIA/DeepLearningExamples/tree/master/PyTorch/Segmentation/nnUNet#training-performance-benchmark)

Build the container:
```
sh build.sh
```
This example requires a significant data download.  So, we're not putting it in a container.  We need to pass through a local directory and then run the data download and pre-processing:
```
# the parameter is where the data will be downloaded to
sh get_data.sh /home/nvidia/data
```

Now, run the benchmark:
```
sh run.sh data_dir n_gpus batch n_dims [--amp]
# on a 1-GPU 16 GB system:
# sh run.sh /home/nvidia/data 1 128 2
# sh run.sh /home/nvidia/data 1 128 2 --amp
# sh run.sh /home/nvidia/data 1 4 3 --amp
```
