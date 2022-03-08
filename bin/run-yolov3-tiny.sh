#!/bin/sh
#export USE_GPU_INFERENCE=1
export CNN_PERF=1 NN_EXT_SHOW_PERF=1 VIV_VX_PROFILE=1
export LD_LIBRARY_PATH=lib:${LD_LIBRARY_PATH}
ldd bin/benchmark_model
exec bin/benchmark_model --enable_op_profiling=true\
    --graph=yolov3-tiny/qrcode-yolov3.tflite\
    --external_delegate_path=lib/libvx_delegate.so\
    "$@" # | tee logs/deeplabv3-CPU.log

#    
