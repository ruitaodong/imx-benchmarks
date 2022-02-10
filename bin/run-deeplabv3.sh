#!/bin/sh
#export USE_GPU_INFERENCE=1

exec bin/benchmark_model --enable_op_profiling=true\
 --graph=lite-model_deeplabv3-mobilenetv2_dm05-float16_1_default_2.tflite\
   "$@" # | tee logs/deeplabv3-CPU.log

#    --external_delegate_path=bin/libvx_delegate.so\
