#!/bin/sh

BENCHMARKS="BERT efficientnet ELECTRA MaskRCNN nnUNet"

DEFAULT_DATA_DIR="${PWD}/data"

if [ ! -d ${DEFAULT_DATA_DIR} ]
then
    mkdir ${DEFAULT_DATA_DIR}
fi

echo `date` using default data dir: ${DEFAULT_DATA_DIR}

echo `date` "getting data"

for bench in ${BENCHMARKS}
do

    echo `date` "--${bench}--"
    cd ${bench}
    ./get_data.sh ${DEFAULT_DATA_DIR}
    cd ..

done

echo `date` "all done"
