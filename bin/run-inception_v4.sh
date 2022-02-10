#!/bin/sh
#export USE_GPU_INFERENCE=1

exec bin/benchmark_model --enable_op_profiling=true\
 --graph=inception_v4_299_quant_20181026/inception_v4_299_quant.tflite\
   "$@" # | tee logs/inception_v4_299_quant-CPU.log

#    --external_delegate_path=bin/libvx_delegate.so\
