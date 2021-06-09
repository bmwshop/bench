## PyTorch BERT benchmark


This is a simple orchestration around the [BERT DL Example](https://github.com/NVIDIA/DeepLearningExamples/tree/master/PyTorch/LanguageModeling/BERT)

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
# BERT large testing:
sh run.sh data_dir n_gpus batch precision [fp16/fp32]
# Note that fp16 translates to automatic mixed precision (AMP)
# fp32 will translate to tf32 if the GPU supports it

# on a 1-GPU 16 GB system:
# sh run.sh /home/nvidia/data 1 10 fp16
# sh run.sh /home/nvidia/data 1 7 fp32

# on a 1-GPU 48 GB system:
# sh run.sh /home/nvidia/data 1 30 fp16
# sh run.sh /home/nvidia/data 1 30 fp32

# BERT base testing

# on a 1-GPU 16 GB system:
# sh run_base.sh /home/nvidia/data 1 48 fp16
# sh run_base.sh /home/nvidia/data 1 26 fp32
# on a 1-GPU 48 GB system:
# sh rurun_basen.sh /home/nvidia/data 1 160 fp16
# sh run_base.sh /home/nvidia/data 1 64 fp32
# on a 1-GPU 8 GB system:
# sh run_base.sh /home/nvidia/data 1 16 fp16
# sh run_base.sh /home/nvidia/data 1 8 fp32

# on a 1-GPU 6 GB system:
# sh run_base.sh /home/nvidia/data 1 8 fp16
# sh run_base.sh /home/nvidia/data 1 4 fp32
```
