#!/bin/sh

#export USE_GPU_INFERENCE=1
export CNN_PERF=1 NN_EXT_SHOW_PERF=1 VIV_VX_PROFILE=1

exec bin/benchmark_model --enable_op_profiling=true\
    --graph=ssd_mobilenet_v1_quantized_300x300_coco14_sync_2018_07_18/model.tflite\
    --external_delegate_path=bin/libvx_delegate.so\
   "$@"  #| tee logs/ssd_mobilenet-GPU.log


