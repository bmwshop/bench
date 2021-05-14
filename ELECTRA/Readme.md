## ELECTRA TF2 benchmark


This is a simple orchestration around the [TF2 Electra Example](https://github.com/NVIDIA/DeepLearningExamples/tree/master/TensorFlow2/LanguageModeling/ELECTRA)

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
sh run.sh data_dir n_gpus batch precision [amp|fp32]
# on a 1-GPU 16 GB system:
# sh run.sh /home/nvidia/data 1 16 amp
```
