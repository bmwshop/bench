## PyTorch BERT benchmark


This is a simple orchestration around the [nnUNet DL Example](https://github.com/NVIDIA/DeepLearningExamples/tree/master/PyTorch/LanguageModeling/BERT)

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
sh run.sh data_dir n_gpus batch precision [fp16/fp32]
# on a 1-GPU 16 GB system:
# sh run.sh /home/nvidia/data 1 10 fp16
# sh run.sh /home/nvidia/data 1 5 fp32
```
