#!/bin/sh
#export USE_GPU_INFERENCE=1
export CNN_PERF=1 NN_EXT_SHOW_PERF=1 VIV_VX_PROFILE=1

exec bin/benchmark_model --enable_op_profiling=true\
    --graph=lite-model_deeplabv3-mobilenetv2_dm05-int8_1_default_2.tflite\
    "$@" # | tee logs/deeplabv3-CPU.log

#    --external_delegate_path=bin/libvx_delegate.so\
