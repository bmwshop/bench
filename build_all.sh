#!/bin/sh

BENCHMARKS="BERT efficientnet ELECTRA MaskRCNN nnUNet"

echo `date` "building images"

for bench in ${BENCHMARKS}
do

    echo `date` "--${bench}--"
    cd ${bench}
    ./build.sh
    cd ..

done

echo `date` "all done"
