## TF2 EfficientNet benchmark. UNFINISHED WORK IN PROGRESS!


This is a simple orchestration around the [EfficientNet v2-S For TensorFlow 2.6](https://github.com/NVIDIA/DeepLearningExamples/tree/master/TensorFlow2/Classification/ConvNets/efficientnet_v2)

Build the container:
```
sh build.sh
```
This example requires a significant data download (imagenet ideally) - the trick would be to find a subset of imagenet that could be downloaded automatically
```
# the parameter is where the data will be downloaded to
sh get_data.sh /home/nvidia/data
```

Now, run the benchmark:
```
sh run.sh data_dir n_gpus batch num_epochs precision [amp|fp32]
# on a 1-GPU 16 GB system:
# sh run.sh /home/nvidia/data 1 16 1 amp
```
